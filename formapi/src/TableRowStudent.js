import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

class TableRow extends Component {
    constructor(props) {
        super(props);
        this.delete = this.delete.bind(this);
    }
    delete() {
        axios.get('http://localhost:60444/students/delete/'+this.props.obj._id)
            .then(console.log('Deleted'))
            .catch(err => console.log(err))
    }

    render() {
        return (
            <tr>
                <td>
                    {this.props.obj.Name}
                </td>
                <td>
                    {this.props.obj.Uid}
                </td>
                <td>
                    {this.props.obj.City}
                </td>
                <td>
                    {this.props.obj.ZipCode}
                </td>
                <td>
                    {this.props.obj.PhoneNumber}
                </td>
                <td>
                    {this.props.obj.ClassA}
                </td>
                <td>
                    {this.props.obj.CitizenID}
                </td>
                <td>
                    <Link to={"/edit/"+this.props.obj._id} className="btn btn-primary">Edit</Link>
                </td>
                <td>
                    <button onClick={this.delete} className="btn btn-danger">Delete</button>
                </td>
            </tr>
        );
    }
}

export default TableRow;