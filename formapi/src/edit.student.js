import React, { Component } from 'react';
import axios from 'axios';

export default class EditStudent extends Component {
    constructor(props) {
        super(props);
        this.onChangeName = this.onChangeName.bind(this);
        this.onChangeUid = this.onChangeUid.bind(this);
        this.onChangeCity = this.onChangeCity.bind(this);
        this.onChangeZipCode = this.onChangeZipCode.bind(this);
        this.onChangePhoneNumber = this.onChangePhoneNumber.bind(this);
        this.onChangeClassA = this.onChangeClassA.bind(this);
        this.onChangeCitizenID = this.onChangeCitizenID.bind(this);
        this.onSubmit = this.onSubmit.bind(this);

        this.state = {
            Name: '',
            Uid: '',
            City:'',
            ZipCode:'',
            PhoneNumber:'',
            ClassA:'',
            CitizenID:'',
        }
    }

    componentDidMount() {
        axios.get('http://localhost:60444/students/edit/'+this.props.match.params.id)
            .then(response => {
                this.setState({
                    Name: response.data.Name,
                    Uid: response.data.Uid,
                    City: response.data.City,
                    ZipCode: response.data.ZipCode,
                    PhoneNumber: response.data.PhoneNumber,
                    ClassA: response.data.ClassA,
                    CitizenID: response.data.CitizenID, });
            })
            .catch(function (error) {
                console.log(error);
            })
    }

    onChangeName(e) {
        this.setState({
            Name: e.target.value
        });
    }

    onChangeUid(e) {
        this.setState({
            Uid: e.target.value
        });
    }

    onChangeCity(e) {
        this.setState({
            City: e.target.value
        });
    }
    onChangeZipCode(e) {
        this.setState({
            ZipCode: e.target.value
        });
    }
    onChangePhoneNumber(e) {
        this.setState({
            PhoneNumber: e.target.value
        });
    }
    onChangeClassA(e) {
        this.setState({
            ZipCode: e.target.value
        });
    }
    onChangeCitizenID(e) {
        this.setState({
            CitizenID: e.target.value
        });
    }
    onSubmit(e) {
        e.preventDefault();
        const obj = {
            Name: this.state.Name,
            Uid: this.state.Uid,
            City: this.state.City,
            ZipCode: this.state.ZipCode,
            PhoneNumber: this.state.PhoneNumber,
            ClassA: this.state.ClassA,
            CitizenID: this.state.CitizenID
        };
        axios.post('http://localhost:60444/students/update/'+this.props.match.params.id, obj)
            .then(res => console.log(res.data));

        this.props.history.push('/index');
    }

    render() {
        return (
            <div style={{ marginTop: 10 }}>
                <h3 align="center">Update Student Info</h3>
                <form onSubmit={this.onSubmit}>
                    <div className="form-group">
                        <label>Name:  </label>
                        <input
                            type="text"
                            className="form-control"
                            value={this.state.Name}
                            onChange={this.onChangeName}
                        />
                    </div>
                    <div className="form-group">
                        <label>Uid: </label>
                        <input type="text"
                               className="form-control"
                               value={this.state.Uid}
                               onChange={this.onChangeUid}
                        />
                    </div>
                    <div className="form-group">
                        <label>City: </label>
                        <input type="text"
                               className="form-control"
                               value={this.state.City}
                               onChange={this.onChangeCity}
                        />
                    </div>
                    <div className="form-group">
                        <label>Zip Code: </label>
                        <input type="text"
                               className="form-control"
                               value={this.state.ZipCode}
                               onChange={this.onChangeZipCode}
                        />
                    </div>
                    <div className="form-group">
                        <label>Phone Number: </label>
                        <input type="text"
                               className="form-control"
                               value={this.state.PhoneNumber}
                               onChange={this.onChangePhoneNumber}
                        />
                    </div>
                    <div className="form-group">
                        <label>Class: </label>
                        <input type="text"
                               className="form-control"
                               value={this.state.ClassA}
                               onChange={this.onChangeClassA}
                        />
                    </div>
                    <div className="form-group">
                        <label>Citizen ID: </label>
                        <input type="text"
                               className="form-control"
                               value={this.state.CitizenID}
                               onChange={this.onChangeCitizenID}
                        />
                    </div>
                    <div className="form-group">
                        <input type="submit"
                               value="Update"
                               className="btn btn-primary"/>
                    </div>
                </form>
            </div>
        )
    }
}