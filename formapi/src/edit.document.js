import React, { Component } from 'react';
import axios from 'axios';

export default class EditDocument extends Component {
    constructor(props) {
        super(props);
        this.onChangeSubject = this.onChangeSubject.bind(this);
        this.onChangeSubjectTitle = this.onChangeSubjectTitle.bind(this);
        this.onChangeDetail = this.onChangeDetail.bind(this);
        this.onChangeLecturers = this.onChangeLecturers.bind(this);
        this.onSubmit = this.onSubmit.bind(this);

        this.state = {
            Subject: '',
            SubjectTitle: '',
            Detail:'',
            Lecturers:''
        }
    }

    componentDidMount() {
        axios.get('http://localhost:60444/documents/editDocument/'+this.props.match.params.id)
            .then(response => {
                this.setState({
                    Subject: response.data.Subject,
                    SubjectTitle: response.data.SubjectTitle,
                    Detail: response.data.Detail,
                    Lecturers: response.data.Lecturers });
            })
            .catch(function (error) {
                console.log(error);
            })
    }

    onChangeSubject(e) {
        this.setState({
            Subject: e.target.value
        });
    }

    onChangeSubjectTitle(e) {
        this.setState({
            SubjectTitle: e.target.value
        });
    }

    onChangeDetail(e) {
        this.setState({
            Detail: e.target.value
        });
    }
    onChangeLecturers(e) {
        this.setState({
            Lecturers: e.target.value
        });
    }

    onSubmit(e) {
        e.preventDefault();
        const obj = {
            Subject: this.state.Subject,
            SubjectTitle: this.state.SubjectTitle,
            Detail: this.state.Detail,
            Lecturers: this.state.Lecturers
        };
        axios.post('http://localhost:60444/documents/updateDocument/'+this.props.match.params.id, obj)
            .then(res => console.log(res.data));

        this.props.history.push('/index');
    }

    render() {
        return (
            <div style={{ marginTop: 10 }}>
                <h3 align="center">Update</h3>
                <form onSubmit={this.onSubmit}>
                    <div className="form-group">
                        <label>Subject:  </label>
                        <input
                            type="text"
                            className="form-control"
                            value={this.state.Subject}
                            onChange={this.onChangeSubject}
                        />
                    </div>
                    <div className="form-group">
                        <label>SubjectTitle: </label>
                        <input type="text"
                               className="form-control"
                               value={this.state.SubjectTitle}
                               onChange={this.onChangeSubjectTitle}
                        />
                    </div>
                    <div className="form-group">
                        <label>Detail: </label>
                        <input type="text"
                               className="form-control"
                               value={this.state.Detail}
                               onChange={this.onChangeDetail}
                        />
                    </div>
                    <div className="form-group">
                        <label>Lecturers: </label>
                        <input type="text"
                               className="form-control"
                               value={this.state.Lecturers}
                               onChange={this.onChangeLecturers}
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